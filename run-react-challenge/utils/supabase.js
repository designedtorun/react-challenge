import { createClient } from "@supabase/supabase-js";

export const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_KEY
);

export const upsertHeadline = async (headline, siteId) => {
  await supabase
    .from("Headline")
    .update({ text: headline })
    .eq("site_id", siteId);
};

export const upsertUrl = async (url, siteId) => {
  await supabase.from("URL").update({ text: url }).eq("site_id", siteId);
};

export const upsertBodyCopy = async (bodyCopy, siteId) => {
  await supabase
    .from("BodyCopy")
    .update({ text: bodyCopy })
    .eq("site_id", siteId);
};
