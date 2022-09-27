import React, {useContext, useEffect, useState} from 'react';
import { Routes, Route } from 'react-router-dom';
import GlobalStyles from './GlobalStyles';
import { ContentWrapper, PageWrapper } from './styles';
import { CharacterProvider, UserContext, deleteRequest, getRequest, DiceProvider } from './hookComponents';
import { StatTestSheet } from './StatTestSheet';
import * as AllChar from './characterComponents'
import * as AllUtil from './utilityComponents'
import * as AllInfo from './gameInfoComponents'


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
               <AllUtil.NavBar user={user} setUser={setUser}/>
               <ContentWrapper>
                    <Routes>
                         <Route index element={<AllUtil.Root />}/>
                         <Route path="*" element={<AllUtil.NotFound />}/>
                         <Route path='login' element={<AllUtil.Login />} />
                         <Route path='signup' element={<AllUtil.Signup />} />
                         <Route path='races' element={<AllInfo.RaceIndex />}/>
                         <Route path='races/:race' element={<AllInfo.RaceDetail />}/>
                         <Route path='classes/:dnd_class' element={<AllInfo.DndClassDetails />}/>
                         <Route path ='/users/:username' element={<AllUtil.UserPage user={user} userCharacters={userCharacters} deleteCharacter={deleteCharacter} />}/>
                         <Route path ='/users/:username/characters/:id/' element={<DiceProvider><AllChar.CharacterSheet /></DiceProvider>}/>
                         <Route path ='/users/:username/characters/:id/edit' element={<AllChar.EditCharacter />}/>
                         <Route path ='/new_character' element={<AllChar.CreateCharacter />}>
                              <Route exact path='basic' element={<AllChar.CharPageOne />}/>
                              <Route exact path='stats' element={<AllChar.CharPageTwo />}/>
                              <Route exact path='skills' element={<AllChar.CharPageThree />}/>
                              <Route exact path='review' element={<AllChar.CharPageFour />}/>
                         </Route>
                         <Route path ='test' element={<StatTestSheet />}/>
                    </Routes>
               </ContentWrapper>
               </PageWrapper>
          </CharacterProvider>
);
}
