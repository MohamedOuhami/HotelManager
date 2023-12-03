import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import dao.IDaoRemote;
import entities.Ville;

public class TestVille {

    public static IDaoRemote<Ville> lookUpVilleRemote() throws NamingException {
        final Hashtable jndiProperties = new Hashtable();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8080");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemote<Ville>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/villeBean!dao.IDaoRemote");
    }

    public static void main(String[] args) {

        try {
            IDaoRemote<Ville> dao = lookUpVilleRemote();

            // Create
            Ville ville1 = new Ville("EL JADIDA");
            Ville ville2 = new Ville("Marrakech");
            Ville ville3 = new Ville("Casablanca");

            dao.create(ville1);
            dao.create(ville2);
            dao.create(ville3);

            System.out.println("Villes after creation:");
            for (Ville v : dao.findAll()) {
                System.out.println(v.getNom() + " " + v.getId());
            }

            // Find by Id
            Ville foundVille = dao.findById(2);
            System.out.println("\nVille found by Id: " + foundVille.getNom());

            // Update
            foundVille.setNom("EL JADIDA Updated");
            dao.update(foundVille);

            System.out.println("\nVilles after update:");
            for (Ville v : dao.findAll()) {
                System.out.println(v.getNom());
            }

            // Delete
            dao.delete(foundVille);

            System.out.println("\nVilles after deletion:");
            for (Ville v : dao.findAll()) {
                System.out.println(v.getNom());
            }

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}
