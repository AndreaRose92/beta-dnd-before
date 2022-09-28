import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import { ErrorContext, UserContext } from "../hookComponents"
import { Error } from '../styles'

export const Signup = () => {

    const navigate = useNavigate()
    const { setUser } = useContext(UserContext)
    const {errors, setErrors} = useContext(ErrorContext)

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('') 
    const [passwordConfirmation, setPasswordConfirmation] = useState('')

    const onSignup = e => {
        e.preventDefault()
        fetch('/signup',{
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                username,
                password,
                password_confirmation: passwordConfirmation
            })
        }).then(r=>{
            if (r.ok) {
                r.json().then(user=>setUser(user))
            } else {
                r.json().then(errors=>setErrors(errors))
            }
        })
        navigate(`/`)
    }

    return (
        <div>
            <form onSubmit={onSignup}>
                <input type='text' placeholder="username" onChange={e=>setUsername(e.target.value)} /><br/>
                <input type='password' placeholder="password" onChange={e=>setPassword(e.target.value)} /><br/>
                <input type='password' placeholder="password confirmation" onChange={e=>setPasswordConfirmation(e.target.value)} /><br/>
                <button type='submit'>Submit</button>
                {errors.map(err=>(
                    <Error key={err}>
                        {err}
                    </Error>
                ))}
            </form>
        </div>
    )

}