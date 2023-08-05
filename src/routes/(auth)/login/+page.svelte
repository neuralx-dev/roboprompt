<script>

    //import {userData} from "$lib/stores/auth.js";

    let email = '';
    let password = '';

    async function handleSubmit() {

        const response = await fetch('http://127.0.0.1:8000/api/auth/login/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({email, password})
        });

        const data = await response.json();

        if (response.ok) {
            // store token as cookie
            /// $userData = data
            localStorage.setItem('userData', JSON.stringify(data))
            console.log(data)
        } else {
            alert('Invalid credentials');
        }

    }

</script>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card bg-transparent border-0 shadow-lg">
                <div class="card-body p-4">
                    <h3 class="text-center">🚪ورود به پنل</h3>
                    <form on:submit|preventDefault={handleSubmit}>
                        <div class="mb-3">
                            <label for="email" class="form-label">✉️ایمیل</label>
                            <input type="email" bind:value={email} id="email" class="form-control"
                                   placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">🔑گذرواژه</label>
                            <input type="password" bind:value={password} id="password" class="form-control"
                                   placeholder="Enter your password">
                        </div>
                        <p>قطعا شما را به خاطر خواهیم سپرد 😜</p>
                        <button type="submit" class="btn btn-primary w-100">ورود</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .card {
        backdrop-filter: blur(10px);
        border-radius: 15px;
        border-color: rgba(255, 255, 255, 0.4) !important;
        border-style: solid !important;
        border-width: 1px !important;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .card > * {
        color: white !important;


    }
</style>
