export type Types = {
    readonly note?:       Note;
    readonly noteCreate?: NoteCreate;
    [property: string]: any;
}

export type Note = {
    readonly id:   number;
    readonly text: string;
    [property: string]: any;
}

export type NoteCreate = {
    readonly text: string;
    [property: string]: any;
}
