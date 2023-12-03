package services;

import java.util.List;

import dao.IDaoLocale;
import dao.IDaoLocaleHotel;
import dao.IDaoRemote;
import dao.IDaoRemoteHotel;
import entities.Hotel;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Stateless(name = "hotelBean")
public class HotelService implements IDaoRemoteHotel<Hotel>, IDaoLocaleHotel<Hotel> {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Hotel create(Hotel o) {
		em.persist(o);
		return o;
	}

	@Override
	public boolean delete(Hotel o) {
		if (!em.contains(o)) {
	        // If not, merge it to attach it to the persistence context
	        o = em.merge(o);
	    }

	    // Now the entity is managed, and it can be removed
	    em.remove(o);

	    return true;
	}

	@Override
	public Hotel update(Hotel o) {
		return em.merge(o);
	}

	@Override
	public Hotel findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Hotel.class, id);
	}

	@Override
	public List<Hotel> findAll() {
		Query query = em.createQuery("select h from Hotel h");
		return query.getResultList();
	}
	
	@Override
	public List<Hotel> findByVille(int villeId) {
	    Query query = em.createQuery("SELECT h FROM Hotel h WHERE h.ville.id = :villeId");
	    query.setParameter("villeId", villeId);
	    return query.getResultList();
	}


}
