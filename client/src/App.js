import React, {useContext, useEffect} from 'react';
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
import { getRequest } from './components/tools/FetchTypes';
import NewCharacter from './components/characters/NewCharacter';
import CharacterSheet from './components/characters/CharacterSheet';
import EditCharacter from './components/characters/EditCharacter';
import { PageWrapper } from './components/styles/Grids.styles';
import NavBar from './components/NavBar';


function App() {

  const {user, setUser} = useContext(UserContext)

  useEffect(()=>{getRequest('/me', setUser)}, [setUser])

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
          <Route path ='/users/:username' element={<UserPage />}/>
          <Route path ='/users/:username/characters/:id/' element={<CharacterSheet />}/>
          <Route path ='/users/:usernane/characters/new' element={<NewCharacter />}/>
          <Route path ='/users/:username/characters/:id/edit' element={<EditCharacter />}/>
        </Routes>
      </PageWrapper>
    </CharacterProvider>
  );
}

export default App;
