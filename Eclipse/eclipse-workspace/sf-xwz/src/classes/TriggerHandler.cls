/**
 * @author xu wenzhen
 * @date 2017/09/25
 * @description トリガーハンドラの基底クラスです。
 */
public abstract class TriggerHandler {
    /**
     * @description トリガーの有効化判定処理。
     */
    public virtual Boolean IsDisabled(){
        return false;
    }

    /**
     * @description before insert トリガーのハンドラ処理。
     * @param newList 対象データ。
     */
    public virtual void BeforeInsert(List<SObject> newList) {}

    /**
     * @description before update トリガーのハンドラ処理。
     * @param oldMap 更新前対象データ。
     * @param newMap 更新後対象データ。
     */
    public virtual void BeforeUpdate(Map<Id, SObject> oldMap, Map<Id, SObject> newMap) {}

    /**
     * @description before delete トリガーのハンドラ処理。
     * @param oldMap 対象データ。
     */
    public virtual void BeforeDelete(Map<Id, SObject> oldMap) {}

    /**
     * @description after insert トリガーのハンドラ処理。
     * @param oldMap 新規作成前対象データ。
     */
    public virtual void AfterInsert(Map<Id, SObject> newMap) {}

    /**
     * @description after update トリガーのハンドラ処理。
     * @param oldMap 更新前対象データ。
     * @param newMap 更新後対象データ。
     */
    public virtual void AfterUpdate(Map<Id, SObject> oldMap, Map<Id, SObject> newMap) {}

    /**
     * @description after delete トリガーのハンドラ処理。
     * @param oldMap 対象データ。
     */
    public virtual void AfterDelete(Map<Id, SObject> oldMap) {}

    /**
     * @description after undelete トリガーのハンドラ処理。
     * @param oldMap 対象データ。
     */
    public virtual void AfterUndelete(Map<Id, SObject> newMap) {}
}