package it.aboutbits;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.jboss.logging.Logger;
import org.keycloak.email.EmailException;
import org.keycloak.email.DefaultEmailSenderProvider;
import org.keycloak.events.Event;
import org.keycloak.events.EventListenerProvider;
import org.keycloak.events.EventType;
import org.keycloak.events.admin.AdminEvent;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.RealmProvider;
import org.keycloak.models.UserModel;

import javax.json.Json;
import javax.json.JsonObject;
import java.io.IOException;
import org.apache.http.entity.ContentType;

public class CustomEventListenerProvider implements EventListenerProvider {

  private static final Logger log = Logger.getLogger(CustomEventListenerProvider.class);

  private final KeycloakSession session;
  private final RealmProvider model;

  public CustomEventListenerProvider(KeycloakSession session) {
    this.session = session;
    this.model = session.realms();
  }

  @Override
  public void onEvent(Event event) {

    if (EventType.REGISTER.equals(event.getType())) {
      log.infof("## NEW %s EVENT", event.getType());
      log.info("-----------------------------------------------------------");

      RealmModel realm = this.model.getRealm(event.getRealmId());
      UserModel newRegisteredUser = this.session.users().getUserById(realm, event.getUserId());

      JsonObject jsonUser = Json.createObjectBuilder()
          .add("email", newRegisteredUser.getEmail())
          .add("first_name", newRegisteredUser.getFirstName())
          .add("last_name", newRegisteredUser.getLastName())
          .add("city_id", newRegisteredUser.getAttribute("city").get(0))
          .add("subscribe_newsletter", newRegisteredUser.getAttribute("subscribe").get(0))
          .build();

      HttpClient httpClient = HttpClients.createDefault();

      HttpPost postRequest = new HttpPost("http://127.0.0.1:8000/core/users");

      StringEntity entity = new StringEntity(jsonUser.toString(), ContentType.APPLICATION_JSON);
      postRequest.setEntity(entity);

      try {
        HttpResponse response = httpClient.execute(postRequest);
        int statusCode = response.getStatusLine().getStatusCode();
        if (statusCode == 200) {
          log.info("Solicitud HTTP POST exitosa.");
        } else {
          log.error("Error en la solicitud HTTP POST. Código de estado: " + statusCode);
        }
      } catch (IOException e) {
        log.error("Error al realizar la solicitud HTTP POST.", e);
      }

      log.info("-----------------------------------------------------------");
    }

  }

  @Override
  public void onEvent(AdminEvent adminEvent, boolean b) {

  }

  @Override
  public void close() {

  }
}
