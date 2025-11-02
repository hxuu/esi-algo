from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from ..dependencies import get_db
from ..authentication.dependencies import oauth2_scheme
from app import crud

router = APIRouter(
    tags=["Problem Set"],
    prefix="/problem-set"
)


@router.get("/exo/all")
async def read_exo(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    return crud.get_exo_all(db)


@router.get("/exo/{td_id}")
async def read_td_exo(td_id: int, token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    return crud.get_td_exo(db, td_id)


@router.get("/td/all")
async def read_td(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    return crud.get_td_all(db)


@router.get("/tp/all")
async def read_tp(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    return crud.get_tp_all(db)


@router.get("/emd/all")
async def read_emd(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    return crud.get_emd_all(db)
