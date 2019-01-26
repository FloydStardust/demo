package com.example.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * Description: demo
 * Created by Floyd on 2019/1/25 10:59
 */
@Entity
@Getter
@Setter
@Table(name = "portfolio")
public class Portfolio {

    @Id
    @GeneratedValue
    Long id;

    String name;    // 项目名
    @ManyToOne
    Fund fund;      // 所属基金

    LocalDateTime date;      // 初投时间
    @Enumerated(EnumType.STRING)
    ShareType shareType;    // 股权性质
    @Enumerated(EnumType.STRING)
    InvestType investType;  // 领投/跟投

    int boardNum;           // 董事会席位

    String investRound;     // 投资轮次

    String investPartner;   // 共同投资人
    @Enumerated(EnumType.STRING)
    MoneyType moneyType;    // 币种

    int investAccount;      // 投资金额

    float investShareRatio; // 投资时股权比例

    float currentShareRatio;// 最新股权比例

    String source;          // 项目来源

    String director;        // 项目执行人

    String manager;         // 项目管理人

    String boarder;         // 董事席位

    String industry;        // 一级行业

    String industrySub;     // 二级行业

    String projectLocation; // 所在地域

    String registerLocation;// 注册地

    String intro;           // 公司介绍
    @Enumerated(EnumType.STRING)
    ExitStatus exitStatus;  // 退出状态
    @Enumerated(EnumType.STRING)
    ExitTye exitTye;        // 退出方式

    LocalDateTime exitTime;          // 退出时间

    int valueAchieved;      // 已实现价值

    int valueAchieving;     // 未实现简直

    int totalValue;         // 总价值

    float returnMultiple;   // 回报倍数

    float IRR;              // Gross IRR

    String valueEvidence;   // 估值依据

    LocalDateTime lastChangeAt;

    @PrePersist
    public void prePersist() {
        lastChangeAt = LocalDateTime.now();
    }

    public static Portfolio build(String name, Fund fund, LocalDateTime date,
                                  ShareType shareType, InvestType investType,
                                  int boardNum, String investRound, String investPartner,
                                  MoneyType moneyType, int investAccount, float investShareRatio,
                                  float currentShareRatio, String source, String director,
                                  String manager, String boarder, String industry, String industrySub,
                                  String projectLocation, String registerLocation, String intro,
                                  ExitStatus exitStatus, ExitTye exitTye, LocalDateTime exitTime,
                                  int valueAchieved, int valueAchieving, int totalValue, float returnMultiple,
                                  float IRR, String valueEvidence){
        Portfolio portfolio = new Portfolio();
        portfolio.name = name;
        portfolio.fund = fund;
        portfolio.date = date;
        portfolio.shareType = shareType;
        portfolio.investType = investType;
        portfolio.boardNum = boardNum;
        portfolio.investRound = investRound;
        portfolio.investPartner = investPartner;
        portfolio.moneyType = moneyType;
        portfolio.investAccount = investAccount;
        portfolio.investShareRatio = investShareRatio;
        portfolio.currentShareRatio = currentShareRatio;
        portfolio.source = source;
        portfolio.director = director;
        portfolio.manager = manager;
        portfolio.boarder = boarder;
        portfolio.industry = industry;
        portfolio.industrySub = industrySub;
        portfolio.projectLocation = projectLocation;
        portfolio.registerLocation = registerLocation;
        portfolio.intro = intro;
        portfolio.exitStatus = exitStatus;
        portfolio.exitTye = exitTye;
        portfolio.exitTime = exitTime;
        portfolio.valueAchieved = valueAchieved;
        portfolio.valueAchieving = valueAchieving;
        portfolio.totalValue = totalValue;
        portfolio.returnMultiple = returnMultiple;
        portfolio.IRR = IRR;
        portfolio.valueEvidence = valueEvidence;

        return portfolio;
    }
    public static enum ShareType {
        COMMON,     // 普通股
        PREFERRED,  // 优先股
    }

    public static enum InvestType {
        LEAD,       // 领投
        FOLLOW,     // 跟投
    }

    public static enum MoneyType {
        DOLLAR,
        RMB,
    }

    public static enum ExitStatus {
        I,          // 未退出
        O,          // 已退出
    }

    public static enum ExitTye {
        IPO,          // IPO
        MERGE,        // 并购
    }

}
