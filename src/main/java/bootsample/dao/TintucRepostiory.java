package bootsample.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import bootsample.model.Tintuc;



public interface TintucRepostiory extends CrudRepository<Tintuc,Integer>{
	 @Query(value = "select * from tintuc order by id desc limit 1", nativeQuery = true)
	  Tintuc HienthitinChinh();
	 
	 @Query(value = "select * from tintuc order by rand() limit 3", nativeQuery = true)
	  List<Tintuc> lienquan();
}
