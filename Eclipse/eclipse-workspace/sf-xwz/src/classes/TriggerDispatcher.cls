/**
 * @author xu wenzhen
 * @date 2017/09/25
 * @description トリガーのディスパッチャクラスです。
 */
public class TriggerDispatcher {

    /**
     * @description トリガーの起動条件により、ハンドラクラスの処理を呼び出す。
     * @param handler ハンドラクラス。
     */
    public static void executeHandler(TriggerHandler handler) {
        // トリガーの有効化判定処理
        if (handler.IsDisabled()) {
            return;
        }

        // トリガーのディスパッチャ処理
        if (Trigger.IsBefore ){
            if (Trigger.IsInsert) {
                // before insert トリガーのハンドラ処理を呼び出す
                handler.BeforeInsert(trigger.new);
            }

            if (Trigger.IsUpdate) {
                // before update トリガーのハンドラ処理を呼び出す
                handler.BeforeUpdate(trigger.oldMap, trigger.newMap);
            }

            if (Trigger.IsDelete) {
                // before Delete トリガーのハンドラ処理を呼び出す
                handler.BeforeDelete(trigger.oldMap);
            }
        }

        if (Trigger.IsAfter){
            if (Trigger.IsInsert) {
                // after insert トリガーのハンドラ処理を呼び出す
                handler.AfterInsert(Trigger.newMap);
            }

            if (Trigger.IsUpdate) {
                // after update トリガーのハンドラ処理を呼び出す
                handler.AfterUpdate(trigger.oldMap, trigger.newMap);
            }

            if (trigger.IsDelete) {
                // after delete トリガーのハンドラ処理を呼び出す
                handler.AfterDelete(trigger.oldMap);
            }

            if (trigger.isUndelete) {
                // after undelete トリガーのハンドラ処理を呼び出す
                handler.AfterUndelete(trigger.newMap);
            }
        }
    }
}