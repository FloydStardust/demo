package com.example.vo;

import java.util.List;

/**
 * Description:
 * Created by Floyd on 2019/2/21 15:17
 */
public class FinancialStatementVo {
    private String columnsName;
    private List<Object> numbers;

    public FinancialStatementVo(String columnsName, List<Object> numbers){
        this.columnsName = columnsName;
        this.numbers = numbers;
    }

    public String getColumnsName() {
        return columnsName;
    }

    public void setColumnsName(String columnsName) {
        this.columnsName = columnsName;
    }

    public List<Object> getNumbers() {
        return numbers;
    }

    public void setNumbers(List<Object> numbers) {
        this.numbers = numbers;
    }
}
