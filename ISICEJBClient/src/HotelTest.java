import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import dao.IDaoRemote;
import dao.IDaoRemoteHotel;
import entities.Hotel;
import entities.Ville;

public class HotelTest {

    public static IDaoRemoteHotel<Hotel> lookUpHotelRemote() throws NamingException {
        final Hashtable jndiProperties = new Hashtable();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8080");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemoteHotel<Hotel>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/hotelBean!dao.IDaoRemoteHotel");
    }
    
    public static IDaoRemote<Ville> lookUpVilleRemote() throws NamingException {
        final Hashtable jndiProperties = new Hashtable();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8080");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemote<Ville>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/villeBean!dao.IDaoRemote");
    }

    public static void main(String[] args) {

        try {
            IDaoRemoteHotel<Hotel> dao = lookUpHotelRemote();
            IDaoRemote<Ville> daoVille = lookUpVilleRemote();

            // Create
            Ville savedVille1 = daoVille.findById(20);
            Ville savedVille2 = daoVille.findById(21);

            Hotel hotel1 = new Hotel(0,"Hotel A", "Address A", "12345", savedVille1);
            Hotel hotel2 = new Hotel(0,"Hotel B", "Address B", "67890", savedVille2);

            dao.create(hotel1);
            dao.create(hotel2);

            System.out.println("Hotels after creation:");
            for (Hotel h : dao.findAll()) {
                System.out.println(h.getNom() + " in " + h.getVille().getNom());
            }

            // Find by Id
            Hotel foundHotel = dao.findById(3);
            System.out.println("\nHotel found by Id: " + foundHotel.getNom() + " in " + foundHotel.getVille().getNom());

            // Update
            foundHotel.setNom("Hotel A Updated");
            dao.update(foundHotel);

            System.out.println("\nHotels after update:");
            for (Hotel h : dao.findAll()) {
                System.out.println(h.getNom() + " in " + h.getVille().getNom());
            }

            // Find by Ville
            System.out.println("\nHotels in " + savedVille1.getNom() + ":");
            for (Hotel h : dao.findByVille(savedVille1.getId())) {
                System.out.println(h.getNom() + " in " + h.getVille().getNom());
            }

            // Delete
            dao.delete(foundHotel);

            System.out.println("\nHotels after deletion:");
            for (Hotel h : dao.findAll()) {
                System.out.println(h.getNom() + " in " + h.getVille().getNom());
            }

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}
