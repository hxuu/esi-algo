from fastapi import FastAPI

from fastapi.middleware.cors import CORSMiddleware

from .authentication import users
from .code_handler import code
from .problem_set import problem


app = FastAPI()


@app.get("/", tags=["Root"])
async def root():
    return {"message": "Hello World"}


origins = ["*", "http://esi-algo.free.nf"]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(users.router)
app.include_router(code.router)
app.include_router(problem.router)
