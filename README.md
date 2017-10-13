# README

* Ruby version 2.3.3

* Deployment instructions

import data with rake:import_votes

There are no empty candidate choices in the supplied list, but the import will skip these through the validation constraint in Candidate Model and rescue block in rake script( also other UTF errors etc )

Database modelling, Campaigns have many Votes and Candidates, Candidates belong to a Campaign and have many Votes, Votes belong to a Campaign and Candidate.

Scoping on Vote model to set validity etc

Basic line checking with regex
