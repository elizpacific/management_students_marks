import Registration from "@/components/Registration.vue";
import SessionManager from "@/components/SessionManager.vue";
import {createRouter, createWebHashHistory} from "vue-router";

const routes = [
    {
        name: "Registration",
        component: Registration,
        path: '/registration'
    },
    {
        name: "SessionManager",
        component: SessionManager,
        path: '/'
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router