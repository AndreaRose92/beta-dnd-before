import React, {useContext, useEffect, useState} from 'react';
import { Routes, Route } from 'react-router-dom';
import { Root } from './Root'
import { Login } from './Login';
import { Signup } from './Signup';
import { CharacterProvider, UserContext } from '../tools/Hooks';
import { UserPage } from './UserPage';
import { NotFound } from './NotFound';
import { RaceIndex } from '../public-info/RaceIndex'
import { RaceDetail } from '../public-info/RaceDetail'
import { deleteRequest, getRequest } from '../tools/FetchTypes';
import CharacterSheet from '../characters/CharacterSheet';
import EditCharacter from '../characters/EditCharacter';
import { ContentWrapper, PageWrapper } from '../styles/Grids.styles';
import NavBar from './NavBar';
import GlobalStyles from '../../GlobalStyles';
import { DiceProvider } from '../tools/PlayerEvents';
import { DndClassDetails } from '../public-info/DndClassDetails';
import CreateCharacter from '../characters/characterCreator/CreateCharacter';
import { CharPageOne } from '../characters/characterCreator/CharPageOne';
import { CharPageTwo } from '../characters/characterCreator/CharPageTwo';
import CharPageThree from '../characters/characterCreator/CharPageThree';
import { CharPageFour } from '../characters/characterCreator/CharPageFour';


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
