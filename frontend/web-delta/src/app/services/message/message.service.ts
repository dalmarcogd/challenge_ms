import {Injectable} from '@angular/core';
import { MatDialog } from '@angular/material';
import { MessageComponent } from '../../components/message/message.component';

@Injectable({ providedIn: 'root' })
export class MessageService {

    constructor(private dialog: MatDialog) { }

    showError(error: string): void {
        this.dialog.open(MessageComponent, {
            data: {errorMsg: error}, width : '250px'
        });
    }
}
