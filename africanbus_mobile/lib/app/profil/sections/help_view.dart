import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpingView extends StatelessWidget {
  const HelpingView({Key? key});

  @override
  Widget build(BuildContext context) {

    const spacer = SizedBox(height: 10);
    const hr = SizedBox(height: 20,);

    final headerTitle = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("FAQ - Questions fréquentes", style: GoogleFonts.acme(color: Colors.blueGrey , fontSize: 25 , fontWeight: FontWeight.bold)),
      ],
    );

    final howToDoReclamationSection = Column(
      children: [
        Text("Comment signaler une réclamation ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(
          color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15

        ),),
        spacer,
        Text("""Chez Urban Bus Ticket's, nous travaillons en étroite collaboration avec tous nos partenaires pour garantir que votre voyage soit le plus agréable et le moins stressant possible. Notre priorité est de vous assurer que vous voyagez de la manière la plus sûre possible, en respectant les normes les plus strictes, de la réservation de votre billet au moment où vous montez à bord du bus. Si vous avez vécu une expérience de voyage négative, nous voulons vous aider à l’améliorer."""),
        spacer,
        Text("""Si vous avez eu un problème avec un membre du personnel de la compagnie de bus, veuillez nous contacter directement en nous fournissant autant de détails que possible concernant votre réclamation. Indiquez-nous sur quel voyage vous étiez et quel était le problème (n'oubliez pas de mentionner votre numéro de référence Urban Bus Ticket's). Vous pouvez également contacter directement la compagnie de bus pour leur faire part de votre plainte au sujet d’un employé."""),
        spacer,
        Text("""En cas de défaut de sécurité lors de votre voyage, signalez immédiatement le problème au chauffeur de bus, informez la compagnie de bus du problème et contactez-nous avec vos informations de voyage et le problème que vous avez rencontré. Votre sécurité est notre priorité, et nous ferons tout pour que toute violation de sécurité fasse l'objet d'une enquête dès que possible."""),
        spacer,
        Text("""Si vous avez un autre type de plainte, quelle qu'elle soit, n'hésitez pas à nous contacter et à expliquer votre problème le plus en détail possible afin que notre équipe puisse démarrer une enquête auprès de notre partenaire. Gardez à l'esprit que nous devons contacter la compagnie de bus, ce qui pourrait allonger le temps de réponse, mais nous ferons tout notre possible pour vous répondre dans les plus brefs délais."""),
        spacer,
        Text("""Vous avez encore une question ? Envoyez-nous un message ici. Notre équipe d'experts vous répondra.Bon voyage !"""),
      ],
    );

    final knowingTimeAnswer = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Combien de temps faut-il pour recevoir une réponse à ma réclamation ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15

        ),),
        spacer,
        Text("""Nous travaillons 24h / 24 et 7j / 7 pour nous assurer que notre équipe est en mesure de vous aider en tout temps. Si vous nous avez contactés via support@urbanbustickets.com ou via notre formulaire d'aide, soyez assuré, l'un des membres de notre équipe lira votre message dès que possible et y répondra."""),
        spacer,
        Text(""" Nous nous efforçons de vous répondre dans les plus brefs délais. La plupart des demandes obtiennent une réponse sous 48 heures. Dans certains cas, il se peut que nous devions mener une enquête plus approfondie afin de pouvoir vous aider. Cela peut inclure de contacter la compagnie de bus en votre nom. Cependant, dans certains cas, nous pouvons subir des retards hors de notre contrôle. Si tel est le cas, nous vous informerons que nous travaillons sur votre cas et ferons tout pour résoudre votre problème."""),
        spacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Vous avez encore une question ?"""),
            Text("""Envoyez-nous un message ici. Notre équipe d'experts vous répondra."""),
          ],
        ),
        spacer,
      ],
    );

    final questionAboutMyBus = Column(
      children: [
        Text("Mon bus n'est pas passé, que dois-je faire ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15

        ),),
        spacer,
        Text("""Parfois, des retards peuvent survenir de manière inattendue en raison de circonstances imprévues. Si votre bus n'est pas venu vous chercher, il existe plusieurs façons de vous aider."""),
        spacer,
        Text("""L'heure de départ est passée et mon bus n'est pas arrivé Si vous attendez votre bus et qu'il n'est toujours pas arrivé au moment de son départ prévu, il est possible que votre voyage soit légèrement retardé. Nous vous suggérons :"""),
        spacer,
        Text("""- Vérifiez que vous attendez au bon endroit de départ (l'adresse se trouve dans votre e-mail de confirmation et parfois directement sur votre billet)."""),
        spacer,
        Text("""- Contactez la compagnie de bus qui gère votre voyage pour demander une mise à jour. Vous pouvez également trouver les coordonnées de la compagnie de bus dans l'e-mail de confirmation que nous vous avons envoyé. Veuillez vérifier sur votre billet s'il existe un numéro de téléphone d'urgence pour la compagnie de bus avec laquelle vous voyagez."""),
        spacer,
        Text("""- Essayez d'abord de trouver un membre du personnel à la station. S'il n'y a pas de membre du personnel, contactez directement la compagnie de bus."""),
        spacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Mon bus n'est jamais passé, que dois-je faire ?"""),
            Text("""- Vérifiez auprès de la compagnie de bus que votre voyage n'est pas retardé. Dans la plupart des cas, vous pouvez trouver les coordonnées de la compagnie de bus sur votre billet PDF ou dans l'e-mail de confirmation."""),
            spacer,
            Text("""- Contactez-nous immédiatement si vous n'avez pas pu voyager en raison d'un bus qui ne s’est pas présenté."""),
            spacer,
            Text("""Nous ferons tout notre possible pour examiner ce problème pour vous y trouver une solution."""),
            spacer
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Vous avez encore une question ?"""),
            Text("""Envoyez-nous un message ici. Notre équipe d'experts vous répondra."""),
          ],
        ),
      ],
    );


    final receiveError = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Je reçois une erreur, pourquoi ma réservation ne fonctionne-t-elle pas ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15

        ),),
        spacer,
        Text("""Pourquoi ai-je reçu un message d'erreur ?"""),
        spacer,
        Text("""Ne vous inquiétez pas, il y a plusieurs raisons pour lesquelles vous avez peut-être reçu un message d'erreur:"""),
        spacer,
        Text("""- La compagnie de voyage rencontre un problème technique dans son système de réservation."""),
        spacer,
        Text("""- Vos informations de paiement n'ont pas été saisies correctement."""),
        spacer,
        Text("""- Nous ne prenons pas en charge votre mode de paiement.."""),
        spacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Que puis-je faire pour réserver mon billet ?"""),
            spacer,
            Text("""Dans la plupart des cas, vous pouvez réserver votre billet avec succès en essayant de nouveau. Si l'erreur est liée à un problème technique provenant du système de la compagnie de bus, essayez d'attendre quelques minutes avant de réessayer votre réservation.Si votre réservation a été refusée en raison d'un problème de paiement, veuillez-vous assurer des éléments suivants avant de réessayer :"""),
            spacer,
            Text("""- Vérifiez que le code de sécurité de votre carte (CVV) est entré correctement."""),
            spacer,
            Text("""- Vérifiez si nous prenons en charge votre mode de paiement"""),
            spacer,
            Text("""Une fois que vous avez fait cela, vous ne devriez avoir aucun problème avec la réservation. Si vous ne parvenez toujours pas à réserver un billet, contactez-nous pour obtenir de l'aide.Envoyez-nous un message ici. Notre équipe d'experts se fera un plaisir de vous répondre."""),
            spacer,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Êtes-vous prêt à réserver votre billet ?"""),
            Text("""Visitez https://www.Urbanbusticket’s.com/"""),
            Text("Bon Voyage !" ,style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold , color: Colors.black),)
          ],
        ),
      ],
    );

    final confirmReservation = Column(
      children: [
        Text("Où est la confirmation de ma réservation ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15
        ),),
        spacer,
        Text("""Immédiatement après la réservation de votre billet, vous serez redirigé vers une page de confirmation sur laquelle vous pourrez télécharger vos billets. Vous pouvez si vous le souhaitez envoyer cette confirmation à une autre adresse e-mail en saisissant la saisissant directement sur cette page.
Une fois votre réservation finalisée, nous vous enverrons un e-mail de confirmation avec tous les détails de votre voyage et l'accès à votre (vos) billet (s). Si vous ne le recevez pas immédiatement, ne vous inquiétez pas, cela peut prendre entre 15 et 20 minutes pour apparaître dans votre boîte de réception."""),
        spacer,
        Text("""- Veuillez vérifier votre dossier spam si vous ne trouvez pas votre confirmation de réservation. Parfois, les e-mails peuvent être considérés comme indésirables par accident."""),
        spacer,
        Text("""- Vous pouvez accéder à votre (vos) ticket (s) directement depuis votre email de confirmation."""),
        spacer,
        Text("""J'ai réservé un billet mais je n'ai pas reçu d'e-mail de confirmation. Que dois-je faire ?""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold , color: Colors.blueGrey),),
        spacer,
        Text("""Si vous avez réservé un billet mais n'avez pas reçu d'e-mail de confirmation, assurez-vous de vérifier que vous avez entré la bonne adresse e-mail."""),
        spacer,
        Text("""- Vous pouvez afficher l'adresse e-mail en vérifiant les informations qui sont affichées sur la page après avoir terminé votre réservation."""),
        spacer,
        Text("""- Si vous avez entré le mauvais e-mail, vous pouvez en saisir un autre sur la page de confirmation qui vous est présentée juste après votre réservation."""),
        spacer,
        Text("""Connectez-vous à votre compte sur l’application mobile avec la même adresse e-mail que celle utilisée pour votre réservation pour accéder et gérer votre réservation en toute simplicité."""),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""Vous avez encore une question ?"""),
            Text("""Envoyez-nous un message ici. Notre équipe d'experts vous répondra."""),
            Text("Bon Voyage !" ,style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold , color: Colors.black),)
          ],
        ),
      ],
    );


    final howToBuy = Column(
      children: [
        Text("Dans quelle devise vais-je payer ma réservation ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
        spacer,
        Text("""Réservations effectuées via le site web de urbanbusticket’s.com""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text("""Lors de la réservation, la devise dans laquelle vous payez sera déterminée par votre pays de facturation. Voici comment cela fonctionne :
Le pays de facturation est utilisé pour déterminer les options de paiement qui vous sont disponibles. L'adresse de facturation associée à votre moyen de paiement doit correspondre au pays de facturation."""),
        spacer,
        Text("""Il est important de noter que votre adresse de résidence peut ne pas être utilisée pour déterminer la devise de facturation. Pour vous assurer d'être facturé dans la bonne devise, veillez à ce que l'adresse de facturation que vous fournissez corresponde au pays de facturation et soit la même que l'adresse associée à votre moyen de paiement."""),
        spacer,
        Text("""Réservations effectuées via l'application urbanbusticket’s (iOS ou Android)""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text("""Lors de la réservation via notre application, la devise de facturation est liée aux paramètres de région de votre appareil. Veuillez-vous assurer de régler la bonne région via les paramètres de votre téléphone pour choisir la devise dans laquelle vous souhaitez payer votre réservation.
Exemple : Réglez la région de votre téléphone sur "Côte d’Ivoire" si vous souhaitez être facturé en (FCFA)."""),
        spacer,
        Text("""Vous avez encore une question ?
Il vous suffit de nous écrire ici. Notre équipe d'experts vous répondra le plus vite possible."""),
        spacer,
        Text("""Bon voyage ? Votre équipe de Urban Bus Ticket’s"""),
      ],
    );


    final wayToBuy = Column(
      children: [
        Text("Comment puis-je payer mon billet " , textAlign: TextAlign.center,style: GoogleFonts.acme(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
        spacer,
        Text("""Vous pouvez payer votre voyage en utilisant les méthodes de paiement suivantes :"""),

        spacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Cartes de crédit ou débit"),
            Text("- Visa"),
            Text("- Mastercard"),
            Text("- American Express"),
          ],
        ),
        spacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Portefeuilles numériques"),
            Text("- Waves"),
            Text("- Mobile Money (Orange Money, MTN Money, Moov Money)"),
          ],
        ),
        spacer,
        Text("""Paiement en plusieurs versements""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text("""Si votre carte est associée à une adresse de facturation en Argentine, Brésil, Mexique, ou Pérou, vous pouvez choisir de régler votre voyage en plusieurs versements. Vous pouvez choisir de payer en 12 versements maximum, dépendant des conditions de votre Banque."""),
        spacer,
        Text("""Vous avez encore des questions ?"""),
        spacer,
        Text("""Envoyez-nous un message ici. Notre équipe d'experts se fera un plaisir de vous répondre."""),
        spacer,
        Text("""Bon voyage !
- Votre équipe Urban Bus Ticket’s""")
      ],
    );

    final howToChangeMyTicket = Column(
      children: [
        Text("Puis-je échanger mon billet ?" , textAlign: TextAlign.center,style: GoogleFonts.acme(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
        spacer,
        Text("""Si les conditions générales de votre billet autorisent les échanges, vous pouvez modifier l'heure ou la date de départ de votre voyage. Veuillez noter qu'il n'est pas possible de changer les lieux de départ ou d'arrivée une fois que vous avez effectué votre réservation. En aucun cas, Urban Bus Ticket’s ne peut échanger ou modifier un billet en votre nom. Si votre billet est échangeable, vous devez contacter directement la compagnie d’autocar pour demander un échange."""),
        spacer,
        Text("""Contactez directement la compagnie d’autocar pour modifier votre trajet""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text(""" - Vous pouvez trouver les coordonnées de la compagnie d’autocar assurant votre voyage depuis votre compte Urban Bus Ticket’s, votre email de confirmation, et sur votre ticket."""),
        spacer,
        Text(""" - Si vous ne trouvez pas les coordonnées de la compagnie d’autocar qui offre votre voyage, veuillez nous contacter pour obtenir de l'aide ici."""),
        spacer,
        Text("""Certains billets doivent être échangés directement à la gare routière""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text(""" - Certaines compagnies d’autocar n'autorisent les échanges qu'à la gare routière."""),
        spacer,
        Text(""" - Si votre billet ne peut être échangé qu'en gare, vous devez vous présenter sur place, conformément aux conditions générales de votre achat."""),
        spacer,
        Text("""Y a-t-il des frais d'échange de mon billet ?""", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
        spacer,
        Text(""" - Certaines compagnies d’autocar facturent des frais pour l'échange de billets."""),
        spacer,
        Text(""" - Tous les frais associés à l'échange de votre billet sont indiqués dans les conditions générales de votre achat."""),
        spacer,
        Text("Veuillez noter qu'il n'est possible de demander un échange que dans les délais impartis, comme indiqué dans la politique d'échange de votre réservation.Si vous avez des doutes sur la façon d'échanger votre billet, veuillez nous contacter directement pour obtenir de l'aide."),
        Text("""Envoyez-nous un message ici. Notre équipe d'experts se fera un plaisir de vous répondre."""),
        spacer,
        Text("""Bon voyage !
- Votre équipe Urban Bus Ticket’s""")
      ],
    );



    final body = SingleChildScrollView(
      padding: EdgeInsets.only(top: 15 , right: 10 , left: 10),
      child: Column(
        children: [
          headerTitle,
          hr,
          howToDoReclamationSection,
          hr,
          hr,
          knowingTimeAnswer,
          hr,
          hr,
          questionAboutMyBus,
          hr,
          hr,
          receiveError,
          hr,
          hr,
          confirmReservation,
          hr,
          hr,
          howToBuy,
          hr,
          hr,
          wayToBuy,
          hr,
          hr,
          howToChangeMyTicket

        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Aide" , style: GoogleFonts.acme(
          color: Colors.black
        ),),
      ),
      body: body,
    );
  }
}
