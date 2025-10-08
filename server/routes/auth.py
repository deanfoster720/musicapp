import uuid
import bcrypt
from fastapi import Depends, HTTPException
from database import get_db
from models.user import User
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from sqlalchemy.orm import Session

router = APIRouter()

@router.post('/signup')
def signup_user(user: UserCreate, db: Session=Depends(get_db)):
    # Check if user is in the database
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(400, "User already exists")

    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt()) # scrambled repeat hashes can put 16 for gensalt

    user_db = User(id=str(uuid.uuid4()), email=user.email, password=hashed_pw, name=user.name) 

    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db