package uaiContacts.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uaiContacts.repository.DepartmentRepository;
import uaiContacts.model.Department;
import uaiContacts.vo.DepartmentListVO;

@Service
@Transactional
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Transactional(readOnly = true)
    public DepartmentListVO findAll(int page, int maxResults) {
        Page<Department> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(Department department) {
        departmentRepository.save(department);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int departmentId) {
        departmentRepository.delete(departmentId);
    }

    @Transactional(readOnly = true)
    public DepartmentListVO findByNameLike(int page, int maxResults, String name) {
        Page<Department> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Department> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Department> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return departmentRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private DepartmentListVO buildResult(Page<Department> result) {
        return new DepartmentListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Department> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return departmentRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Department> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Department> result) {
        return result.getTotalElements() > 0;
    }
}