# Simulateur de File d'Attente d'Impression (Linux/C)

[cite_start]Projet académique réalisé en 3ème année de Licence Informatique[cite: 51], axé sur la programmation système sous Linux.

## Objectif

L'objectif est de simuler une file d'attente d'impression (spooler) en langage C, en utilisant les mécanismes de communication inter-processus (IPC) de Linux.

## Fonctionnement

* Un processus "serveur" (le spouleur) gère la file d'attente.
* Plusieurs processus "clients" peuvent soumettre des demandes d'impression.
* Le serveur traite les demandes une par une, en simulant le temps d'impression.

## Compétences techniques mises en œuvre

* Langage C
* Appels système Linux : `fork()` pour créer les processus
* Communication Inter-Processus : `pipe()` pour la communication entre clients et serveur
* Gestion basique des processus
