import React, {useContext, useEffect} from 'react';
import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import './App.css';
import { Login } from './components/Login';
import { Signup } from './components/Signup';
import { UserContext } from './components/tools/Hooks';
import { UserPage } from './components/UserPage';
import { NotFound } from './components/NotFound';
import { RaceIndex } from './components/RaceIndex'
import { RaceDetail } from './components/RaceDetail'
import { DndClassIndex } from './components/DndClassIndex'
import { DndClassDetail } from './components/DndClassDetail'
import LevelDetail from './components/LevelDetail';
import { getRequest } from './components/tools/FetchTypes';


function App() {

  const {setUser} = useContext(UserContext)

  useEffect(()=>{getRequest('/me', setUser)}, [setUser])

  return (
    <>
      <Routes>
        <Route index element={<Root />}/>
        <Route path="*" element={<NotFound />}/>
        <Route path='login' element={<Login />} />
        <Route path='signup' element={<Signup />} />
        <Route path='races' element={<RaceIndex />}>
          <Route path=':race' element={<RaceDetail />}/>
        </Route>
        <Route path='dnd_classes' element={<DndClassIndex />}/>
        <Route path=':dnd_class' element={<DndClassDetail />}/>
        <Route path=':dnd_class/:level' element={<LevelDetail />}/>
        <Route path ='/users/:username' element={<UserPage />}/>
      </Routes>
    </>
  );
}

export default App;
