import React, {useContext, useEffect, useState} from 'react';
import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import { Login } from './components/Login';
import { Signup } from './components/Signup';
import { CharacterProvider, UserContext } from './components/tools/Hooks';
import { UserPage } from './components/UserPage';
import { NotFound } from './components/NotFound';
import { RaceIndex } from './components/public-info/RaceIndex'
import { RaceDetail } from './components/public-info/RaceDetail'
import { deleteRequest, getRequest } from './components/tools/FetchTypes';
import NewCharacter from './components/characters/NewCharacter';
import CharacterSheet from './components/characters/CharacterSheet';
import EditCharacter from './components/characters/EditCharacter';
import { ContentWrapper, PageWrapper } from './components/styles/Grids.styles';
import NavBar from './components/NavBar';
import DeleteMessage from './components/DeleteMessage';
import GlobalStyles from './GlobalStyles';
import { DiceProvider } from './components/tools/PlayerEvents';
import { DndClassDetails } from './components/public-info/DndClassDetails';


function App() {

  const {user, setUser} = useContext(UserContext)

  const [userCharacters, setUserCharacters] = useState([])

  const updateCharacters = data => {
    setUserCharacters(characters => [...characters, data])
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
        <GlobalStyles />
        <NavBar user={user} setUser={setUser}/>
        <ContentWrapper>
          <Routes>
            <Route index element={<Root />}/>
            <Route path="*" element={<NotFound />}/>
            <Route path='login' element={<Login />} />
            <Route path='signup' element={<Signup />} />
            <Route path='races' element={<RaceIndex />}/>
            <Route path='races/:race' element={<RaceDetail />}/>
            <Route path='classes/:dnd_class' element={<DndClassDetails />}/>
            <Route path ='/users/:username' element={<UserPage user={user} userCharacters={userCharacters} deleteCharacter={deleteCharacter} />}/>
            <Route path ='/users/:username/delete' element={<DeleteMessage /> }/>
            <Route path ='/users/:username/characters/:id/' element={<DiceProvider><CharacterSheet /></DiceProvider>}/>
            <Route path ='/users/:usernane/characters/new' element={<NewCharacter updateCharacters={updateCharacters} />}/>
            <Route path ='/users/:username/characters/:id/edit' element={<EditCharacter />}/>
          </Routes>
        </ContentWrapper>
      </PageWrapper>
    </CharacterProvider>
  );
}

export default App;
