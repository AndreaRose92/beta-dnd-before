import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import './App.css';
import { Login } from './components/Login';
import { Signup } from './components/Signup';
import { UserProvider } from './components/tools/Hooks';
import { UserPage } from './components/UserPage';
import { NotFound } from './components/NotFound';


function App() {
  return (
    <UserProvider>
      <Routes>
        <Route index element={<Root />}/>
        <Route path="*" element={<NotFound />}/>
        <Route path='login' element={<Login />} />
        <Route path='signup' element={<Signup />} />
        <Route path ='/:username' element={<UserPage />}/>
      </Routes>
    </UserProvider>
  );
}

export default App;
