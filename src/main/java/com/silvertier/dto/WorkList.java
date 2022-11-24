package com.silvertier.dto;

import java.util.ArrayList;

//조우철
public class WorkList {
    private ArrayList<WorkDTO> list = new ArrayList<>();
    private int pageSize = 10;
    private int totalCount = 0;
    private int totalPage = 0;
    private int currentPage = 1;
    private int startNo = 0;
    private int endNo = 0;
    private int startPage = 0;
    private int endPage = 0;

    public WorkList() {
    }

    public WorkList(int pageSize, int totalCount, int currentPage) {
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.currentPage = currentPage;
        calculator();
    }

    private void calculator() {
        totalPage = (totalCount - 1) / pageSize + 1;
        currentPage = Math.min(currentPage, totalPage);
        // oracle은 select sql 명령 실행결과 인덱스 값이 1부터 시작되므로 mysql에 사용했던 계산식에 1을
        // 더해서 사용해야 한다.
        startNo = (currentPage - 1) * pageSize + 1;
        endNo = startNo + pageSize - 1;
        endNo = Math.min(endNo, totalCount);
        startPage = (currentPage - 1) / 10 * 10 + 1;
        endPage = startPage + 9;
        endPage = Math.min(endPage, totalPage);
    }

    public ArrayList<WorkDTO> getList() {
        return list;
    }

    public void setList(ArrayList<WorkDTO> list) {
        this.list = list;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getStartNo() {
        return startNo;
    }

    public void setStartNo(int startNo) {
        this.startNo = startNo;
    }

    public int getEndNo() {
        return endNo;
    }

    public void setEndNo(int endNo) {
        this.endNo = endNo;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    @Override
    public String toString() {
        return "WorkDTO{" +
                "list=" + list +
                ", pageSize=" + pageSize +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                ", startNo=" + startNo +
                ", endNo=" + endNo +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                '}';
    }


}
