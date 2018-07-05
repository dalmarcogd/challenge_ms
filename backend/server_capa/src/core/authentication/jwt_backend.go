package authentication

import (
	"crypto/rsa"
	"crypto/x509"
	"time"

	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/core/redis"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/settings"
	jwt "github.com/dgrijalva/jwt-go"
	"github.com/pborman/uuid"
	"golang.org/x/crypto/bcrypt"
)

type JWTAuthenticationBackend struct {
	privateKey *rsa.PrivateKey
	PublicKey  *rsa.PublicKey
}

const (
	tokenDuration = 72
	expireOffset  = 3600
)

var authBackendInstance *JWTAuthenticationBackend = nil

func InitJWTAuthenticationBackend() *JWTAuthenticationBackend {
	if authBackendInstance == nil {
		authBackendInstance = &JWTAuthenticationBackend{
			privateKey: getPrivateKey(),
			PublicKey:  getPublicKey(),
		}
	}

	return authBackendInstance
}
func (backend *JWTAuthenticationBackend) GenerateToken(userUUID string) (string, error) {
	token := jwt.New(jwt.SigningMethodRS512)
	token.Header["exp"] = time.Now().Add(time.Hour * time.Duration(settings.Get().JWTExpirationDelta)).Unix()
	token.Header["iat"] = time.Now().Unix()
	token.Header["sub"] = userUUID
	tokenString, err := token.SignedString(backend.privateKey)
	if err != nil {
		panic(err)
		return "", err
	}
	return tokenString, nil
}
func (backend *JWTAuthenticationBackend) Authenticate(user *models.User) bool {
	hashedPassword, _ := bcrypt.GenerateFromPassword([]byte("testing"), 10)

	testUser := models.User{
		UUID:     uuid.New(),
		Username: "haku",
		Password: string(hashedPassword),
	}

	return user.Username == testUser.Username && bcrypt.CompareHashAndPassword([]byte(testUser.Password), []byte(user.Password)) == nil
}
func (backend *JWTAuthenticationBackend) getTokenRemainingValidity(timestamp interface{}) int {
	if validity, ok := timestamp.(float64); ok {
		tm := time.Unix(int64(validity), 0)
		remainer := tm.Sub(time.Now())
		if remainer > 0 {
			return int(remainer.Seconds() + expireOffset)
		}
	}
	return expireOffset
}
func (backend *JWTAuthenticationBackend) Logout(tokenString string, token *jwt.Token) error {
	redisConn := redis.Connect()
	return redisConn.SetValue(tokenString, tokenString, backend.getTokenRemainingValidity(token.Header["exp"]))
}
func (backend *JWTAuthenticationBackend) IsInBlacklist(token string) bool {
	redisConn := redis.Connect()
	redisToken, _ := redisConn.GetValue(token)

	if redisToken == nil {
		return false
	}

	return true
}
func getPrivateKey() *rsa.PrivateKey {
	privateKey := settings.Get().PrivateKeyPath

	privateKeyImported, err := x509.ParsePKCS1PrivateKey([]byte(privateKey))

	if err != nil {
		panic(err)
	}

	return privateKeyImported
}
func getPublicKey() *rsa.PublicKey {
	publicKey := settings.Get().PublicKeyPath

	publicKeyImported, err := x509.ParsePKIXPublicKey([]byte(publicKey))

	if err != nil {
		panic(err)
	}

	rsaPub, ok := publicKeyImported.(*rsa.PublicKey)

	if !ok {
		panic(err)
	}

	return rsaPub
}
