import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);




import { useState } from "react";

function App() {
  const [profile, setProfile] = useState({
    name: "John Doe",
    email: "john@example.com",
    age: "21"
  });

  const [form, setForm] = useState(profile);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
    setError("");
    setSuccess("");
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    // validation
    if (!form.name || !form.email || !form.age) {
      setError("All fields are required.");
      return;
    }

    // email pattern check
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(form.email)) {
      setError("Enter a valid email address.");
      return;
    }

    if (isNaN(form.age) || form.age <= 0) {
      setError("Age must be a positive number.");
      return;
    }

    // save updates
    setProfile(form);
    setSuccess("Profile updated successfully!");
  };

  return (
    <div style={{ padding: "20px" }}>
      <h2>User Profile Editor</h2>

      <h3>Current Profile</h3>
      <p><b>Name:</b> {profile.name}</p>
      <p><b>Email:</b> {profile.email}</p>
      <p><b>Age:</b> {profile.age}</p>

      <hr />

      <h3>Edit Profile</h3>

      {error && <p style={{ color: "red" }}>{error}</p>}
      {success && <p style={{ color: "green" }}>{success}</p>}

      <form onSubmit={handleSubmit}>
        <div>
          <label>Name: </label>
          <input
            name="name"
            value={form.name}
            onChange={handleChange}
            placeholder="Enter name"
          />
        </div>

        <br />

        <div>
          <label>Email: </label>
          <input
            name="email"
            value={form.email}
            onChange={handleChange}
            placeholder="Enter email"
          />
        </div>

        <br />

        <div>
          <label>Age: </label>
          <input
            name="age"
            value={form.age}
            onChange={handleChange}
            placeholder="Enter age"
          />
        </div>

        <br />

        <button type="submit">Update Profile</button>
      </form>
    </div>
  );
}

export default App;
