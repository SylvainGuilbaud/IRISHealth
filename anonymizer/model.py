from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class AnonymizedIdentifiable(db.Model):
    __tablename__ = 'anonymized_identifiable'

    # id primary key with autoincrement
    id = db.Column(db.Integer, primary_key=True)
    # resource_type with a maximum length of 255 characters
    resource_type = db.Column(db.String(255))
    # resource_id with a maximum length of 255 characters
    resource_id = db.Column(db.String(255))
    # resource_id_anonymized with a maximum length of 255 characters
    resource_id_anonymized = db.Column(db.String(255))
    # create a unique constraint on resource_type and resource_id
    __table_args__ = (db.UniqueConstraint('resource_type', 'resource_id'),)

