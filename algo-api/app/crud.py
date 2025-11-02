import re
from sqlalchemy.orm import Session

from . import models, schemas, authentication as atu


def add_td_exos(cleaned_text: str, owner_id: int, db: Session):
    # Extract exercises using case-insensitive regular expressions
    exercises = re.findall(
        r'(?i)exercice [IVX\d]+\s*:.+?(?=exercice [IVX\d]+|$)', cleaned_text, re.DOTALL)

    # Trim leading and trailing spaces from each exercise
    exercises = [exercise.strip() for exercise in exercises]
    model_class = models.Exo
    to_add = []
    for exo in exercises:
        to_add.append(model_class(description=exo, tp_id=7))

    print(to_add)
    db.add_all(to_add)
    db.commit()


1


def add_tp_exos(cleaned_text: str, owner_id: int, db: Session):
    questions = re.findall(r'\d+\..+?(?=\n\d+\.|\Z)',
                           cleaned_text, re.DOTALL)

    # Trim leading and trailing spaces from each question
    questions = [question.strip() for question in questions]
    model_class = models.Exo

    to_add = []
    for question in questions:
        to_add.append(model_class(description=question, tp_id=7))

    print(to_add)

    db.add_all(to_add)
    db.commit()


def add_emd_exos(cleaned_text: str, owner_id: int, db: Session):
    # Extract exercises using case-insensitive regular expressions
    exercises = re.findall(
        r'(?i)exercice [IVX\d]+\s*:.+?(?=exercice [IVX\d]+|$)', cleaned_text, re.DOTALL)

    # Trim leading and trailing spaces from each exercise
    exercises = [exercise.strip() for exercise in exercises]
    model_class = models.Exo

    exercises = [model_class(description=exercise, emd_id=owner_id)
                 for exercise in exercises]

    db.add_all(exercises)
    db.commit()


def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()


def get_user_by_username(db: Session, username: str):
    return db.query(models.User).filter(models.User.username == username).first()


def get_users(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.User).offset(skip).limit(limit).all()


def create_user_in_db(db: Session, user: schemas.UserCreate):

    db_user = models.User(
        username=user.username,
        hashed_password=atu.dependencies.get_hash_password(user.password)
    )
    db.add(db_user)
    db.commit()
    return db_user


def create_td(db: Session, td: schemas.XCreate):
    db_td = models.Td(
        number=td.number,
        semester=td.semester,
        topic=td.topic
    )
    db.add(db_td)
    db.commit()
    db.refresh(db_td)
    return db_td


def get_td_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Td).offset(skip).limit(limit).all()


def get_tp_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Tp).offset(skip).limit(limit).all()


def get_emd_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Emd).offset(skip).limit(limit).all()


def get_exo_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Exo).offset(skip).limit(limit).all()


def get_exo_by_id(db: Session, exo_id: int):
    return db.query(models.Exo).filter(models.Exo.id == exo_id).first()


def get_td_exo(db: Session, td_id: int):
    return db.query(models.Exo).filter(models.Exo.td_id == td_id).all()
