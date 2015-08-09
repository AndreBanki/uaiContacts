package uaiContacts.vo;

import uaiContacts.model.Department;

import java.util.List;

public class DepartmentListVO {
    private int pagesCount;
    private long totalDepartments;

    private String actionMessage;
    private String searchMessage;

    private List<Department> departments;

    public DepartmentListVO() {
    }

    public DepartmentListVO(int pages, long totalDepartments, List<Department> departments) {
        this.pagesCount = pages;
        this.departments = departments;
        this.totalDepartments = totalDepartments;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public long getTotalDepartments() {
        return totalDepartments;
    }

    public void setTotalDepartments(long totalDepartments) {
        this.totalDepartments = totalDepartments;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
}