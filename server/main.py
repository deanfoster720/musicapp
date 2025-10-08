# Imports are essential
from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
import uuid

app = FastAPI()

DATABASE_URL = "postgresql://postgres:Wintermute1!@localhost:5432/musicapp"

create_engine(DATABASE_URL)

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush=False, bind=engine)

db = SessionLocal()

class UserCreate(BaseModel):
    name: str
    email: str
    password: str

# Creates database models / blueprints
Base = declarative_base()
class User(Base):
    __tablename__ = "users"

    id = Column(TEXT, primary_key=True, index=True)
    name = Column(VARCHAR(100), )
    email = Column(VARCHAR(100), )
    password = Column(LargeBinary, )

@app.post('/signup')
def signup_user(user: UserCreate):
    # Check if user is in the database
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        return "User already exists"

    user_db = User(id=str(uuid.uuid4()), email=user.email, password=user.password, name=user.name) 

    db.add(user_db)
    db.commit()

    return user_db

Base.metadata.create_all(engine)