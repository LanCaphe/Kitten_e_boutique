# E-boutique de chats ( nom

## Composition de l'équipe

Projet final: plateforme de réservation de Glaglarelais
Lea, Manon, Maxime, Edouard, Tibo
Mentor : bfraikin

##Le projet

Dans le cadre du suivi de notre formation The Hacking project, nous avons à réaliser le développement et la production d'une application Rails de vente de photos de chatons. Le projet est à réaliser en équipe avec un tableau trello comme support pour nous habituer à travailler en équipe afin de nosu préparer au projet final. 

Lien du site en production: 

##Les fonctionnalités du site

Le site propose à la vente des photos de chatons.
 	Sur la page d'accueil du site, comprendra la liste des produits qui sont à vendre. Un visiteur peut cliquer sur l'un des produits pour l'afficher et avoir plus de détails sur le produit. Le visiteur devra s'inscrire pour ajouter ce produit à son panier.

Un utilisateur peut accéder facilement à son panier, modifier la quantité de produits à acheter, puis accéder au checkout pour payer. Il paiera via Stripe le total, il recevra un email avec la·les photo·s de chaton·s. L'administrateur du site recevra aussi un email avec le récapitulatif de la commande qui vient d'être passée.

(a compléter si features suplémentaires)

## Versions de rails et gems uttilisées:

ruby '2.5.1'
* gem 'stripe': pour gérer les paiements
* gem 'devise': pour créer le back de l'identification
Pour la database:
* gem 'sqlite3', en développement
* gem 'pg' en production
* gem rspec pour une partie des tests. 







