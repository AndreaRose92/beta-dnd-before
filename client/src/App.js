import { Routes, Route } from 'react-router-dom';
import { Root } from './components/Root'
import './App.css';


function App() {
  return (
    <>
      <Routes>
        <Route index element={<Root />}/>
      </Routes>
    </>
  );
}

export default App;
