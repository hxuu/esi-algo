from sqlalchemy import ARRAY, Boolean, Column, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.sql.schema import ForeignKey

from .database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    hashed_password = Column(String)
    disabled = Column(Boolean, default=False)


class Td(Base):
    __tablename__ = "tds"

    id = Column(Integer, primary_key=True, index=True)
    semester = Column(Integer)
    title = Column(String)
    topic = Column(String)

    exos = relationship("Exo", back_populates="td")


class Tp(Base):
    __tablename__ = "tps"

    id = Column(Integer, primary_key=True, index=True)
    semester = Column(Integer)
    title = Column(String)
    topic = Column(String)

    exos = relationship("Exo", back_populates="tp")


class Emd(Base):
    __tablename__ = "emds"

    id = Column(Integer, primary_key=True, index=True)
    semester = Column(Integer)
    title = Column(String)
    topic = Column(String)

    exos = relationship("Exo", back_populates="emd")


class Exo(Base):
    __tablename__ = "exos"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String)
    start_code = Column(String)
    input_ = Column(String)
    output = Column(String)
    td_id = Column(Integer, ForeignKey('tds.id'))
    tp_id = Column(Integer, ForeignKey('tps.id'))
    emd_id = Column(Integer, ForeignKey('emds.id'))

    td = relationship("Td", back_populates="exos")
    tp = relationship("Tp", back_populates="exos")
    emd = relationship("Emd", back_populates="exos")
