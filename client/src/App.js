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
import CharacterSheet from './components/characters/CharacterSheet';
import EditCharacter from './components/characters/EditCharacter';
import { ContentWrapper, PageWrapper } from './components/styles/Grids.styles';
import NavBar from './components/NavBar';
import GlobalStyles from './GlobalStyles';
import { DiceProvider } from './components/tools/PlayerEvents';
import { DndClassDetails } from './components/public-info/DndClassDetails';
import CreateCharacter from './components/characters/characterCreator/CreateCharacter';
import { CharPageOne } from './components/characters/characterCreator/CharPageOne';
import { CharPageTwo } from './components/characters/characterCreator/CharPageTwo';
import CharPageThree from './components/characters/characterCreator/CharPageThree';
import { CharPageFour } from './components/characters/characterCreator/CharPageFour';


export const App = () => {

     const {user, setUser} = useContext(UserContext)
     const [userCharacters, setUserCharacters] = useState([])


     const deleteCharacter = e => {
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
                         <Route path ='/users/:username/characters/:id/' element={<DiceProvider><CharacterSheet /></DiceProvider>}/>
                         <Route path ='/users/:username/characters/:id/edit' element={<EditCharacter />}/>
                         <Route path ='/new_character' element={<CreateCharacter />}>
                              <Route exact path='basic' element={<CharPageOne />}/>
                              <Route exact path='stats' element={<CharPageTwo />}/>
                              <Route exact path='skills' element={<CharPageThree />}/>
                              <Route exact path='review' element={<CharPageFour />}/>
                         </Route>
                    </Routes>
               </ContentWrapper>
               </PageWrapper>
          </CharacterProvider>
);
}
