package me.pa3.quest.vos {
public class Action {
    public static const EYE:Action = new Action();
    public static const HAND:Action = new Action();
    public static const BOOT:Action = new Action();
    public static const NONE:Action = new Action();


    public function toString():String {
        if (this == EYE) return "EYE";
        if (this == HAND) return "HAND";
        if (this == BOOT) return "BOOT";
        return "NONE";
    }
}
}
