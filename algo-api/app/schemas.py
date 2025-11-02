from pydantic import BaseModel


class UserBase(BaseModel):
    username: str


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int
    disabled: bool

    class Config:
        orm_mode = True


class XBase(BaseModel):
    semester: int
    label: str
    topic: str


class XCreate(XBase):
    pass


class X(XCreate):
    id: int
    exos: list = []

    class Config:
        orm_mode = True


class ExoBase(BaseModel):
    description: str


class ExoCreate(ExoBase):
    pass


class Exo(ExoBase):
    id: int
    td_id: int
    tp_id: int
    emd_id: int

    class Config:
        orm_mode = True


class StartCodeUpdate(BaseModel):
    start_code: str


class TestCaseCreate(BaseModel):
    input_: str
    output: str


class ExoUpdateRequest(BaseModel):
    exo_id: int
    start_code: str
    test_cases: list


class ExoUpdateResponse(BaseModel):
    exo_id: int
    start_code: str
    test_cases: list


class TokenData(BaseModel):
    username: str = None


class LiveCode(BaseModel):
    code: str
    input_: str
    output: str
