import React, { useContext, useEffect } from 'react';
import { Routes, Route } from 'react-router-dom';
import GlobalStyles from './GlobalStyles';
import { ContentWrapper, PageWrapper } from './styles';
import { CharacterProvider, UserContext, DiceProvider, AuthRoutes } from './hookComponents';
import { StatTestSheet } from './StatTestSheet';
import * as AllChar from './characterComponents'
import * as AllUtil from './utilityComponents'
import * as AllInfo from './gameInfoComponents'


export const App = () => {

     const {user, setUser} = useContext(UserContext)
     // const [userCharacters, setUserCharacters] = useState([])


     // const deleteCharacter = e => {
     //      fetch(`/characters/${e.target.value}`, {method: "DELETE"}).then(()=>{
     //           setUserCharacters(characters => characters.filter(character => character.id !== e.target.value))
     //      })
     // }

     // useEffect(()=>{getRequest('/me', setUser)}, [setUser])
     // useEffect(()=>{getRequest('/characters', setUserCharacters)}, [setUserCharacters]);
     useEffect(()=>{
          fetch('/me').then(r=>{
               if (r.ok) {
                    r.json().then(me=>setUser(me))
               } else {
                    r.json().then(errors=>console.log(errors))
               }
          })
     }, [setUser])
     // useEffect(()=>{
     //      fetch(`/characters`).then(r=>{
     //           if (r.ok) {
     //                r.json().then(data=>setUserCharacters(data))
     //           } else {
     //                r.json().then(errors=>console.log(errors))
     //           }
     //      })
     // }, [setUserCharacters])

     return (
          <CharacterProvider>
               <PageWrapper>
               <GlobalStyles />
               <AllUtil.NavBar user={user} setUser={setUser}/>
               <ContentWrapper>
                    <Routes>
                         <Route index element={<AllUtil.Root/>}/>
                         <Route path="*" element={<AllUtil.NotFound/>}/>
                         <Route path='login' element={<AllUtil.Login/>} />
                         <Route path='signup' element={<AllUtil.Signup/>} />
                         <Route path='races' element={<AllInfo.RaceIndex/>}/>
                         <Route path='races/:race' element={<AllInfo.RaceDetail/>}/>
                         <Route path='classes/:dnd_class' element={<AllInfo.DndClassDetails/>}/>
                         <Route path ='/users/:username' element={<AuthRoutes><AllUtil.UserPage/></AuthRoutes>}/>
                         <Route path ='/users/:username/characters/:id/' element={<DiceProvider><AllChar.CharacterSheet/></DiceProvider>}/>
                         <Route path ='/users/:username/characters/:id/edit' element={<AuthRoutes><AllChar.EditCharacter/></AuthRoutes>}/>
                         <Route path ='/new_character' element={<AuthRoutes><AllChar.CreateCharacter /></AuthRoutes>}>
                              <Route exact path='basic' element={<AllChar.CharBasicsPage/>}/>
                              <Route exact path='stats' element={<AllChar.CharStatsPage/>}/>
                              <Route exact path='skills' element={<AllChar.CharSkillsPage/>}/>
                              <Route exact path='review' element={<AllChar.CharSpellsPage/>}/>
                              <Route exact path='spells' element={<AllChar.CharReviewPage/>}/>
                         </Route>
                         <Route path ='test' element={<StatTestSheet/>}/>
                    </Routes>
               </ContentWrapper>
               </PageWrapper>
          </CharacterProvider>
);
}
