import axios from "axios";

export default axios.create({
  baseURL: "http://studydevops.io.vn:8080/api",
  headers: {
    "Content-type": "application/json"
  }
});
