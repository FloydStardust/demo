package com.example.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Description: Profit and loss table item
 * Created by Floyd on 2019/1/29 17:40
 */
@Getter
@Setter
@Table(name = "profit")
public class ProfitTable {

    @Id
    @GeneratedValue
    Long id;



}
