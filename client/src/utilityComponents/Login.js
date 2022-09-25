import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import { postRequest } from "../hookComponents/FetchTypes"
import { UserContext } from "../hookComponents/Hooks"

export const Login = () => {

    const navigate = useNavigate()
    const {setUser} = useContext(UserContext)

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')

    const onLogin = e => {
        e.preventDefault()
        postRequest('/login', {username, password}, setUser)
        navigate(`/users/${username}`)
    }

    return (
        <div>
            <form onSubmit={onLogin}>
                <input type='text' placeholder="username" onChange={e=>setUsername(e.target.value)} /><br/>
                <input type='password' placeholder="password" onChange={e=>setPassword(e.target.value)} /><br/>
                <button type='submit'>Submit</button>
            </form>
        </div>
    )

}