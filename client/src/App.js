import React, {useContext, useEffect, useState} from 'react';
import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import './App.css';
import { Login } from './components/Login';
import { Signup } from './components/Signup';
import { CharacterProvider, UserContext } from './components/tools/Hooks';
import { UserPage } from './components/UserPage';
import { NotFound } from './components/NotFound';
import { RaceIndex } from './components/public-info/RaceIndex'
import { RaceDetail } from './components/public-info/RaceDetail'
import { DndClassIndex } from './components/public-info/DndClassIndex'
import { DndClassDetail } from './components/public-info/DndClassDetail'
import LevelDetail from './components/public-info/LevelDetail';
import { deleteRequest, getRequest } from './components/tools/FetchTypes';
import NewCharacter from './components/characters/NewCharacter';
import CharacterSheet from './components/characters/CharacterSheet';
import EditCharacter from './components/characters/EditCharacter';
import { PageWrapper } from './components/styles/Grids.styles';
import NavBar from './components/NavBar';


function App() {

  const {user, setUser} = useContext(UserContext)

  const [userCharacters, setUserCharacters] = useState([])

  const updateCharacters = data => {
    setUserCharacters(characters => [...characters, data])
    // console.log(userCharacters)
  }

  const deleteCharacter = e => {
    console.log(e.target.value)
    deleteRequest(`/characters/${e.target.value}`)
    setUserCharacters(characters => characters.filter(character => character.id !== e.target.value))
    
  }

  useEffect(()=>{getRequest('/me', setUser)}, [setUser])
  useEffect(()=>{getRequest('/characters', setUserCharacters)}, [setUserCharacters]);


  return (
    <CharacterProvider>
      <PageWrapper>
        <NavBar user={user} setUser={setUser}/>
        <Routes>
          <Route index element={<Root />}/>
          <Route path="*" element={<NotFound />}/>
          <Route path='login' element={<Login />} />
          <Route path='signup' element={<Signup />} />
          <Route path='races' element={<RaceIndex />}/>
          <Route path='races/:race' element={<RaceDetail />}/>
          <Route path='dnd_classes' element={<DndClassIndex />}/>
          <Route path=':dnd_class' element={<DndClassDetail />}/>
          <Route path=':dnd_class/:level' element={<LevelDetail />}/>
          <Route path ='/users/:username' element={<UserPage user={user} userCharacters={userCharacters} deleteCharacter={deleteCharacter} />}/>
          <Route path ='/users/:username/characters/:id/' element={<CharacterSheet />}/>
          <Route path ='/users/:usernane/characters/new' element={<NewCharacter updateCharacters={updateCharacters} />}/>
          <Route path ='/users/:username/characters/:id/edit' element={<EditCharacter />}/>
        </Routes>
      </PageWrapper>
    </CharacterProvider>
  );
}

export default App;
