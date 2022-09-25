import React, {useContext, useEffect, useState} from 'react';
import { Routes, Route } from 'react-router-dom';
import { Root } from './Root'
import { Login } from './Login';
import { Signup } from './Signup';
import { CharacterProvider, UserContext } from '../hookComponents/Hooks';
import { UserPage } from './UserPage';
import { NotFound } from './NotFound';
import { RaceIndex } from '../gameInfoComponents/RaceIndex'
import { RaceDetail } from '../gameInfoComponents/RaceDetail'
import { deleteRequest, getRequest } from '../hookComponents/FetchTypes';
import CharacterSheet from '../characterComponents/CharacterSheet';
import EditCharacter from '../characterComponents/EditCharacter';
import { ContentWrapper, PageWrapper } from '../styles/Grids.styles';
import NavBar from './NavBar';
import GlobalStyles from '../GlobalStyles';
import { DiceProvider } from '../hookComponents/PlayerEvents';
import { DndClassDetails } from '../gameInfoComponents/DndClassDetails'
import CreateCharacter from '../characterComponents/characterCreator/CreateCharacter';
import { CharPageOne } from '../characterComponents/characterCreator/CharPageOne';
import { CharPageTwo } from '../characterComponents/characterCreator/CharPageTwo';
import CharPageThree from '../characterComponents/characterCreator/CharPageThree';
import { CharPageFour } from '../characterComponents/characterCreator/CharPageFour';


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
