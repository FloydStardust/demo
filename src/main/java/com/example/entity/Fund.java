package com.example.entity;

import lombok.Getter;

import javax.persistence.*;

/**
 * Description: demo
 * Created by VKC on 2019/1/25 11:04
 */

@Getter
@Table(name = "fund")
public class Fund {

    @Id
    @GeneratedValue
    Long id;

    @Column(unique = true)
    String name;

    public static Fund build(String name) {
        final Fund fund = new Fund();
        fund.name = name;
        return fund;
    }

    @Override
    public String toString() {
        return name;
    }
}
