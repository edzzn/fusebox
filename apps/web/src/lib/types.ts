export type Types = {
    readonly note?:       Note;
    readonly noteCreate?: NoteCreate;
    [property: string]: unknown;
}

export type Note = {
    readonly id:   number;
    readonly note: string;
    [property: string]: unknown;
}

export type NoteCreate = {
    readonly note: string;
    [property: string]: unknown;
    
}
