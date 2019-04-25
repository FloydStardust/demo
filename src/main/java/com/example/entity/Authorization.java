package com.example.entity;

/**
 * Description:
 * Created by Floyd on 2019/4/3 16:32
 */
public class Authorization extends Entity {
    private int uid;
    private int authorizer;
    private int authorizee;
    private int level;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getAuthorizer() {
        return authorizer;
    }

    public void setAuthorizer(int authorizer) {
        this.authorizer = authorizer;
    }

    public int getAuthorizee() {
        return authorizee;
    }

    public void setAuthorizee(int authorizee) {
        this.authorizee = authorizee;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
