package uaiContacts.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import uaiContacts.model.Department;

public interface DepartmentRepository extends PagingAndSortingRepository<Department, Integer> {
    Page<Department> findByNameLike(Pageable pageable, String name);
}