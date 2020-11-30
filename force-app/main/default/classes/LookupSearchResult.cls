public class LookupSearchResult {
    private Id id;
    private String sObjectType;
    private String title;
    private String subtitle;

    public LookupSearchResult(Id id, String sObjectType, String title, String subtitle) {
        this.id = id;
        this.sObjectType = sObjectType;
        this.title = title;
        this.subtitle = subtitle;
    }

    public Id getId() {
        return id;
    }

    public String getSObjectType() {
        return sObjectType;
    }

    public String getTitle() {
        return title;
    }

    public String getSubtitle() {
        return subtitle;
    }
}