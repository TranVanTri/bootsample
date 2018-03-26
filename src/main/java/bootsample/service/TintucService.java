package bootsample.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bootsample.dao.TintucRepostiory;

import bootsample.model.Tintuc;

@Service
@Transactional
public class TintucService {
	
	private final TintucRepostiory tintucRepostiory;
	
	public TintucService(TintucRepostiory tintucRepostiory) {
		this.tintucRepostiory=tintucRepostiory;
	}
	public List<Tintuc> findAll(){
		List<Tintuc> tintucs = new ArrayList<>();
		for(Tintuc tintuc : tintucRepostiory.findAll())
		{
			tintucs.add(tintuc);
		}
		return tintucs;
	}
	
	public Tintuc findTintuc(int id) {
		return tintucRepostiory.findOne(id);
	}
	public void save(Tintuc tintuc) {
		tintucRepostiory.save(tintuc);
	}
	public void delete(int id) {
		tintucRepostiory.delete(id);
	}
	
	public Tintuc xem() {
		return tintucRepostiory.HienthitinChinh();
	}
	public List<Tintuc> lienquan(){
		List<Tintuc> tintucs = new ArrayList<>();
		for(Tintuc tintuc : tintucRepostiory.lienquan())
		{
			tintucs.add(tintuc);
		}
		return tintucs;
	}
}
