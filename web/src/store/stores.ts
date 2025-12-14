import { writable } from "svelte/store";

/** Returns boolean value of if the resource is visible or not */
export const visibility = writable(false);

interface Jobs {
    name: string;
    label: string;
    description: string;
    image: string;
}

interface Licenses {
    name: string;
    label: string;
    license: string;
    price: number;
}

export const jobs = writable<Jobs[]>([]);
export const licenses = writable<Licenses[]>([]);
export const playerLicenses = writable<string[]>([]);