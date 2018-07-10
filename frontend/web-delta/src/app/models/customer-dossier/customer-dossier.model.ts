import { BaseModel } from '../base/base.model';
import { DebtModel } from '../debt/debt.model';
import { PatrimonyModel } from '../patrimony/patrimony.model';
import { SourceIncomeModel } from '../source_income/source_income.model';
import { FinancialTransactionModel } from '../financial_transaction/financial_transaction.model';


export class CustomerDossierModel extends BaseModel {

  private _cpf: String;
  private _name: String;
  private _date_birth: Date;
  private _address: String;
  private _debts: Array<DebtModel>;
  private _patrimonies: Array<PatrimonyModel>;
  private _financial_transactions: Array<FinancialTransactionModel>;
  private _sources_income: Array<SourceIncomeModel>;

    /**
     * Getter cpf
     * @return {String}
     */
  public get cpf(): String {
    return this._cpf;
  }

    /**
     * Getter name
     * @return {String}
     */
  public get name(): String {
    return this._name;
  }

    /**
     * Getter date_birth
     * @return {Date}
     */
  public get date_birth(): Date {
    return this._date_birth;
  }

    /**
     * Getter address
     * @return {String}
     */
  public get address(): String {
    return this._address;
  }

    /**
     * Getter debts
     * @return {Array<DebtModel>}
     */
  public get debts(): Array<DebtModel> {
    return this._debts;
  }

    /**
     * Getter patrimonies
     * @return {Array<PatrimonyModel>}
     */
  public get patrimonies(): Array<PatrimonyModel> {
    return this._patrimonies;
  }

    /**
     * Getter financial_transactions
     * @return {Array<FinancialTransactionModel>}
     */
  public get financial_transactions(): Array<FinancialTransactionModel> {
    return this._financial_transactions;
  }

    /**
     * Getter sources_income
     * @return {Array<SourceIncomeModel>}
     */
  public get sources_income(): Array<SourceIncomeModel> {
    return this._sources_income;
  }

    /**
     * Setter cpf
     * @param {String} value
     */
  public set cpf(value: String) {
    this._cpf = value;
  }

    /**
     * Setter name
     * @param {String} value
     */
  public set name(value: String) {
    this._name = value;
  }

    /**
     * Setter date_birth
     * @param {Date} value
     */
  public set date_birth(value: Date) {
    this._date_birth = value;
  }

    /**
     * Setter address
     * @param {String} value
     */
  public set address(value: String) {
    this._address = value;
  }

    /**
     * Setter debts
     * @param {Array<DebtModel>} value
     */
  public set debts(value: Array<DebtModel>) {
    this._debts = value;
  }

    /**
     * Setter patrimonies
     * @param {Array<PatrimonyModel>} value
     */
  public set patrimonies(value: Array<PatrimonyModel>) {
    this._patrimonies = value;
  }

    /**
     * Setter financial_transactions
     * @param {Array<FinancialTransactionModel>} value
     */
  public set financial_transactions(value: Array<FinancialTransactionModel>) {
    this._financial_transactions = value;
  }

    /**
     * Setter soruces_income
     * @param {Array<SourceIncomeModel>} value
     */
  public set sources_income(value: Array<SourceIncomeModel>) {
    this._sources_income = value;
  }
}
