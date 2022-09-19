import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import './App.css';
import { Login } from './components/Login';
import { Signup } from './components/Signup';
import { UserProvider } from './components/tools/Hooks';
import { UserPage } from './components/UserPage';
import { NotFound } from './components/NotFound';
import { RaceIndex } from './components/RaceIndex'
import { RaceDetail } from './components/RaceDetail'
import { DndClassIndex } from './components/DndClassIndex'
import { DndClassDetail } from './components/DndClassDetail'


function App() {
  return (
    <UserProvider>
      <Routes>
        <Route index element={<Root />}/>
        <Route path="*" element={<NotFound />}/>
        <Route path='login' element={<Login />} />
        <Route path='signup' element={<Signup />} />
        <Route path='races' element={<RaceIndex />}>
          <Route path=':race' element={<RaceDetail />}/>
        </Route>
        <Route path='dnd_classes' element={<DndClassIndex />}>
          <Route path=':dnd_class' element={<DndClassDetail />}/>
        </Route>
        <Route path ='/users/:username' element={<UserPage />}/>
      </Routes>
    </UserProvider>
  );
}

export default App;
