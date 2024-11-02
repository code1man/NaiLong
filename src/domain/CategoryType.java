package domain;

/*商品类型*/
public enum CategoryType {
    NAILONG_TANGTANG_EMOJI("奶龙唐唐表情包"),
    NAILONG_OTHER_EMOJI("奶龙其他表情包"),
    NAILONG_EMOTION_EMOJI("奶龙情绪表情包"),
    NAILONG_WALLPAPER("奶龙壁纸"),
    NAILONG_DOLL("奶龙玩偶"),
    NAILONG_EDUCATIONAL_TOY("奶龙儿童早教玩具"),
    NAILONG_BLIND_BOX("奶龙盲盒"),
    NAILONG_CUP("奶龙水杯/保温杯/咖啡杯"),
    NAILONG_KEYCHAIN("奶龙钥匙扣"),
    NAILONG_FIGURE("奶龙手办/摆件");

    private final String description;

    CategoryType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
